pragma solidity ^0.4.8;

contract Token{
     //uint totalSupply;      //pas utilisée pour l'instant
     Client[] clients;      //tableau dans lequel on stocke les clients
     //uint idMagasin;        //pas utilisé
     //string nomMagasin;
     uint initialAmount = 0;
     uint limiteCumul = 20;
    
    struct Client{
        address id;
        string name;
        uint nbpoints;
    }
    
    
    address public Admin;       //défini l'administrateur de la Blockchain
    
    mapping (address => Client) nbpoints;
    //nbPointsParClient[msg.sender]= _initialAmount;
        
     //function balances(address _owner) constant returns (uint256 balance);

     /*function Token(uint256 _initialAmount, string _tokenName, string _id)
     {
         
         //mapping (address => Client) = public clients ;
         nbPointsParClient[msg.sender]= _initialAmount;
         totalSupply = _initialAmount;
     }*/
     
     function AjoutClient(string _name)
     {
         for(uint i=0;i<clients.length; i++)    //on parcours tous les clients
         {
             if(clients[i].id == msg.sender)        //si il est dejà présent, on quitte 
             {
                 throw;
             }
         else{
             clients.push(Client({      //sinon on ajoute le nouveau client au tableau en initialisant son nb de points à 0
                id:msg.sender,
                name:_name,
                nbpoints:initialAmount}));
            }
         }
     }
     function AttribuerPoints(address _id)
     {
         //uint i=0;
         if (msg.sender == Admin)       //Seul l'administrateur est autorisé à attribuer des points
         {
             for(uint i=0; i<clients.length; i++)   //on parcourt tous les clients
             {
                 if (clients[i].id == _id)      //si l'adresse correspond à celle rentrée par l'admin
                 {
                     clients[i].nbpoints++;     //on ajoute 1 point au client correspondant à cette adresse
                 }                              //à perfectionner : quantité de points
                 else
                 {
                     throw;                 //sinon on sort de la fonction
                 }
             }
         }
     }
     function PointsExchange(address _id, uint _quantity)
     {
         uint i;
         uint j;
         for(i=0; i<clients.length; i++){       //on parcours une premiere fois tous les clients
             if (clients[i].id == msg.sender){      //jusqu'a ce que l'utilisateur qui veut donner des points
                 uint emetteur = i;                 //se trouve lui même
                 break;                             //on stocke la position dans le tableau de l'utilisateur dans la variable "emetteur"
             }                                      //break : on arrête la boucle avant la fin
         }
         for(j=0; j<clients.length; j++){       //scan de tous les clients
            if(clients[j].id == _id){           //jusqu'à trouver l'adresse renseignée par l'utilisateur/emetteur
                uint recepteur = j;             //on stocke la position dans le tableau de l'utilisateur dans la variable "recepteur
                break;
            }
            else{
                throw;
                //MessageBox.Show("le compte auquel vous voulez attribuer des points n'existe pas");
            }
         }
         if ((emetteur == recepteur)||(clients[i].nbpoints<_quantity)){            //on ne peut pas s'envoyer des points à soi même
            throw;                                                              //on ne peut pas donner plus que ce que l'on possède
            
         }
         else{
            clients[i].nbpoints -= _quantity;    //emetteur perd la quantité renseignée
            clients[j].nbpoints += _quantity;    //recepteur gagne la quantité renseignée par
         }
     }
     function PointSpend(uint _quantity){
         for(uint i=0; i<clients.length; i++){       //on parcours tous les clients
             if (clients[i].id == msg.sender){ 
                 if(clients[i].nbpoints<_quantity){
                     throw;
                     //MessageBox.Show("Ne jamais dépenser plus que ce que l'on a")
                 }
                 else{
             clients[i].nbpoints -= _quantity;
                 }
             }
         }
     }
     
}
