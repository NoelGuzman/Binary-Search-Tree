package BSTops is

   type STR10 is new String (1..10);
   
   type BSTPoint is limited private;
   
   procedure InsertNode(temp : in out BSTPoint; Curr : in out BSTPoint; CusName : in STR10);
   
   procedure NewNode(temp : out BSTPoint; CusName : in STR10; CusPhone : in STR10);
   
   procedure InsertBST(Root : in out BSTPoint; CusName : in STR10; CusPhone : STR10);
   
   procedure FindCustomerIterative(Root : in BSTPoint; CusName : in STR10; CusPoint : out BSTPoint);
   
   procedure FindCustomerRecursive(Curr: in BStPoint; CusName:  in STR10; CusPoint:  out BSTPoint);
   
   procedure InOrderSuccessor(TreePoint: in BSTPoint ; Curr : out BSTPoint);
   
   procedure InOrderTraversal (TreePoint : in BSTPoint);
   
   function CustomerName(TreePoint: in BSTPoint) return STR10;
   
   function CustomerPhone(TreePoint: in BSTPoint) return STR10;
   
   procedure PreOrderTraversalIterative(TreePoint: in BSTPoint);
   
private
	
   type Customer is 
      record	
         Name:  STR10;
         PhoneNumber: Str10;
      end record;
	
   type BSTNode;
   type BSTPoint is access BSTNode;
	
   type BSTNode is 
      record
         Llink, Rlink:  BSTPoint;
         Ltag, Rtag:  Boolean;
         Info:  Customer;
      end record;

end BSTops;
