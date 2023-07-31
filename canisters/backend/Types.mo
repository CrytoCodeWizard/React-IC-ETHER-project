import Text "mo:base/Text";
import System "System";

module {

  public type CreateSuccess = {
    createTime : System.Time;
  };

  public type PrincipalView = {
    ethWallets : [Text];
  };

  public module Resp {

    public type Login = { principal : Principal } and CreateSuccess and PrincipalView;

    public type ConnectEthWallet = Bool;
  };

  public module Address {
    public type Address = Text;
    public let hash = Text.hash;
    public let equal = Text.equal;
  };

  public module EthWallet {
    public type Address = Address.Address;
    public type SignedPrincipal = Text;
  };

  public module Nft {
    public type Nft = {
      owner : Address.Address;
      contract : Address.Address;
      tokenId : Nat;
    };
  };

  public type EthWallet = EthWallet.Address;
  public type SignedPrincipal = EthWallet.SignedPrincipal;

  // Stored in stable memory, for each wallet-principal pair we check:
  public type SignatureCheckSuccess = {
    signedPrincipal : SignedPrincipal;
    checkTime : System.Time;
  };
};