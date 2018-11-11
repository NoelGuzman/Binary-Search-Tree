with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with BSTops; use BSTops;
with Ada.Text_IO.Unbounded_IO; use Ada.Text_IO.Unbounded_IO;

procedure Bstmain is

   type action is (Insert, FindRecursive, FindIterative,
                   InOrderZuccTrav, TraversePreOrder, Finished);
   package actionIO is new Ada.Text_IO.Enumeration_IO(action); use actionIO;

   BSTRoot : BSTPoint;
   Curr : BSTPoint;
   Op : action;
   Name , TName : STR10;
   PhoneNum : STR10;
   StartRoot : Character;

   procedure Length10 (temp : in out STR10) is
      TransferString : Unbounded_String;
      STRlength : Integer;
   begin

      TransferString := Get_Line;
      STRlength := Length(TransferString);

        for I in Integer range 1..10 loop
         if I <= STRlength then
            temp(I) := element(TransferString,I);
         else
            temp(I) := ' ';
         end if;
      end loop;
   end Length10;

begin

   Get(Op);
   Skip_Line;
   while Op /= Finished loop
      case Op is
            when Insert =>
            Length10(Name);
            Length10(PhoneNum);
            InsertBST(BSTRoot, Name, PhoneNum);
            Put(String(Name)); Put(" | "); Put(String(PhoneNum)); New_Line;
         when FindRecursive =>
            Length10(Name);
           -- Name := Length10;
            FindCustomerRecursive(BSTRoot, Name, Curr);
            PhoneNum := CustomerPhone(Curr);
            Put(String(Name)); Put(" | "); Put(String(PhoneNum)); New_Line;

         when FindIterative =>
            Length10(Name);
           -- Name := Length10;
            FindCustomerIterative(BSTRoot, Name, Curr);
            PhoneNum := CustomerPhone(Curr);
            Put(String(Name)); Put(" | "); Put(String(PhoneNum));New_Line;

         when InOrderZuccTrav =>
            Get(StartRoot);
            Skip_Line;
            if StartRoot = 'Y' then
               InOrderTraversal(BSTRoot);
            else
               Length10(Name);
               FindCustomerIterative(BSTRoot, Name, Curr);
               InOrderTraversal(Curr);
            end if;

         when TraversePreOrder =>
            PreOrderTraversalIterative(BSTRoot);
         when Finished =>
            exit;
      end case;
      Get(Op);
      Skip_Line;
   end loop;

end Bstmain;
