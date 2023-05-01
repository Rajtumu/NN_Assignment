trigger CreateChildAccount on Account (after insert) {
    List<Account> childAccountsToInsert = new List<Account>();
    List<Account> parentAccountsToUpdate = new List<Account>();
    
    for(Account account : Trigger.new) {
        // Check if account has a parent account
        if(account.ParentId != null) {
            // Check if the parent account has any child accounts
            Account parentAccount = [SELECT Id, (SELECT Id FROM ChildAccounts) FROM Account WHERE Id = :account.ParentId];
            if(parentAccount.ChildAccounts.isEmpty()) {
                // Create a child account for the parent account if it doesn't have one already
                Account childAccount = new Account();
                childAccount.Name = parentAccount.Name + ' Child';
                childAccount.ParentId = parentAccount.Id;
                childAccountsToInsert.add(childAccount);
            }
        } else {
            // Create a child account for the legacy account
            Account childAccount = new Account();
            childAccount.Name = account.Name + ' Child';
            childAccount.ParentId = account.Id;
            childAccountsToInsert.add(childAccount);
            
            // Update the parent account to link it to the new child account
            account.ParentId = childAccount.Id;
            parentAccountsToUpdate.add(account);
        }
    }
    
    insert childAccountsToInsert;
    update parentAccountsToUpdate;
}