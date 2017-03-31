pragma solidity ^0.4.9;

/// @title Solidity Smart-contract in order to manage an Electronic Vote using Ethereum Blockchain.
/// @author Jean-Mickael Nounahon - <nounahon.j@gmail.com>

Contract ElectronicVoteESILV {

uint electionEndTime; 
string[] candidates; // Registered candidates
mapping (string => uint) votes; // Candidate ID to number of votes
mapping (address => bool) voters; // Registered voters
mapping (address => bool) hasVoted; // If a registered voter has voted or not
    
     /// @param _owner The address from which the balance will be retrieved
    ///
    function Election(){
        electionAuthority = msg.sender;
    }
     /// @param _owner Only the authority launch the contract
    ///
    modifier OnlyElectionAuthorityCanLaunchVote() {
        if (msg.sender != electionAuthority) throw;
        _;
    }
    
    modifier RegisterVotersCanVot() {
        if (!voters[msg.sender]) throw;
        _;
    }
    
    modifier VoteOnlyOneTime() {
        if (hasVoted[msg.sender]) throw;
        _;
    }
    
    modifier OnlyDuringElectionTime() {
        if (electionEndTime == 0 || electionEndTime > block.timestamp) throw;
        _;
    }
     /// @param _owner The duration ( uint ) of an election
    /// @return void
    function CommencerElection(uint duration)
        only_election_authority
    {
        electionEndTime = block.timestamp + duration;
    }
    
   /// @param _owner the id of the people you vote to
   /// @return
    function EnregisterCandidat(string id)
        only_election_authority
    {
        candidates.push(id);
    }
    
    function VoterRegister(address addr)
        only_election_authority
    {
        voters[addr] = true;
    }
    
    function Vote(string id)
        only_registered_voters
        vote_only_once
        only_during_election_time
    {
        votes[id] += 1;
        hasVoted[msg.sender] = true;
    }
    
     /// @param _owner void
    /// @return The number of candidate
    function GetNumCandidate() constant returns(uint) {
        return candidates.length;
    }
    
     /// @param _owner The number of the Candidate
    /// @return his name and the number of voters for him
   
    function GetCandidate(uint i)
        constant returns(string _candidate, uint _votes)
    {
        _candidate = candidates[i];
        _votes = votes[_candidate];
    }

}
