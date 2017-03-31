pragma solidity ^0.4.8;

contract Token {
    
    // ERC Base standard evolution of declaration 
    // Before it was function totalSupply() constant returns (uint246 supply);

    /// total amount of tokens 
    uint256 public ESILV_TOKEN = 123456789123456789123456789 ;

    // Goal of the event : Triggered when tokens are transferred.
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    // Goal of the event : triggered when there is an appproval 
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    /// @param _owner The address from which the balance will be retrieved
    /// @return The balance
    function balanceOf(address _owner) constant returns (uint256 balance);

 
    /// @param _value The amount of token to be transferred
    /// @return Success of tranfert
    function transfer(address _to, uint256 _value) returns (bool success);

   
    /// @param _value The amount of token to be transferred
    /// @return Success of tranfer
    function transferFrom(address _from, address _to, uint256 _value) returns (bool SuccessOhYeah);

   
    /// @param _value The amount of tokens to be approved for transfer
    /// @return Whether the approval was successful or not
    function approve(address _spender, uint256 _value) returns (bool success);

    /// @param _owner The address of the account owning tokens
    /// @param _spender The address of the account able to transfer the tokens
    /// @return Amount of remaining tokens allowed to spent
    function allowance(address _owner, address _spender) constant returns (uint256 allowed);

}
