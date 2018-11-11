with Ada.Text_IO; Use Ada.Text_IO;

package body BSTops is

   Knt : Integer;

   ----------------
   -- InsertNode --
   ----------------

   procedure InsertNode
     (temp : in out BSTPoint;
      Curr : in out BSTPoint;
      CusName : in STR10)
   is
   begin
      if CusName >= Curr.Info.Name then
         temp.Rlink := Curr.Rlink; temp.Rtag := Curr.Rtag;
         Curr.Rlink := temp; Curr.Rtag := True; temp.Ltag := False;

         if temp.Rtag = True then
            temp.Rlink.Llink := temp;
         end if;
      else
         temp.Llink := curr.Llink; temp.Ltag := Curr.Ltag;
         Curr.Llink := temp; Curr.Ltag := True; temp.Rtag := False;

         if temp.Ltag = True then
            temp.Llink.Rlink := temp;
         end if;
      end if;
   end InsertNode;

   -------------
   -- NewNode --
   -------------

   procedure NewNode
     (temp : out BSTPoint;
      CusName : in STR10;
      CusPhone : in STR10)
   is
   begin
      temp := new BSTNode;
      temp.info.Name := CusName;
      temp.info.PhoneNumber := CusPhone;
      temp.Llink := null;
      temp.Rlink := null;
      temp.Ltag := False;
      temp.Rtag := False;
      Knt := Knt + 1;
   end NewNode;

   ---------------
   -- InsertBST --
   ---------------

   procedure InsertBST
     (Root : in out BSTPoint;
      CusName : in STR10;
      CusPhone : in STR10)
   is
      temp : BSTPoint;
      Curr : BSTPoint;
   begin
      if Root = null then
         NewNode(Root,CusName, CusPhone);
      else
         Curr := Root;
         loop
            if CusName < Curr.Info.Name then
               if Curr.Llink /= null then
                  Curr := Curr.Llink;
               else
                  NewNode(temp, CusName, CusPhone);
                  InsertNode(temp, Curr, CusName);
                  exit;
               end if;
            elsif CusName > Curr.Info.Name then
               if curr.Rlink /= null then
                  curr := curr.Rlink;
               else
                  NewNode(temp, CusName, CusPhone);
                  InsertNode(temp,Curr,Cusname);
                  exit;
               end if;
            else
               NewNode(temp, CusName, CusPhone);
               InsertNode(temp,Curr,Cusname);
               exit;
            end if;
         end loop;
      end if;

   end InsertBST;

   ---------------------------
   -- FindCustomerIterative --
   ---------------------------

   procedure FindCustomerIterative
     (Root : in BSTPoint;
      CusName : in STR10;
      CusPoint : out BSTPoint)
   is
      Curr : BSTPoint := Root;
   begin
      loop
         if CusName < Curr.Info.Name then
            if Curr.Llink = null then
               CusPoint := null;
               exit;
            end if;
            Curr := Curr.Llink;
         elsif CusName > Curr.Info.Name then
            if Curr. Rlink = null then
               CusPoint := null;
               exit;
            end if;
            curr := curr.Rlink;
         else
            CusPoint := Curr;
            exit;
         end if;
      end loop;

   end FindCustomerIterative;

   ---------------------------
   -- FindCustomerRecursive --
   ---------------------------

   procedure FindCustomerRecursive
     (Curr: in BStPoint;
      CusName:  in STR10;
      CusPoint:  out BSTPoint)
   is
   begin
      if Curr /= null then
         if curr.info.Name > CusName then
            FindCustomerRecursive(Curr.Llink, CusName, CusPoint);
         elsif curr.Info.Name < CusName then
            FindCustomerRecursive(Curr.Rlink, CusName, CusPoint);
         else
            CusPoint := curr;
         end if;
      else
         CusPoint := Curr;
      end if;

   end FindCustomerRecursive;

   ----------------------
   -- InOrderSuccessor --
   ----------------------

   procedure InOrderSuccessor (TreePoint: in BSTPoint ; Curr : out BSTPoint) is
      Starter : BSTPoint := TreePoint;
      temp : BSTPoint;
   begin
      temp := Starter.Rlink;
      if Starter.Rtag = False then
         null;
      else
         while temp.Ltag = True loop
            temp := temp.Llink;
         end loop;
      end if;
      Curr := temp;
   end InOrderSuccessor;

   ------------------
   -- CustomerName --
   ------------------

   function CustomerName (TreePoint: in BSTPoint) return STR10 is
   begin
      if treepoint /= null then
         return TreePoint.Info.Name;
      end if;
      return "null      ";
   end CustomerName;

   -------------------
   -- CustomerPhone --
   -------------------

   function CustomerPhone (TreePoint: in BSTPoint) return STR10 is
   begin
      if treepoint /= null then
         return TreePoint.Info.PhoneNumber;
      end if;
      return "null      ";
   end CustomerPhone;

   --------------------------------
   -- PreOrderTraversalIterative --
   --------------------------------

   procedure PreOrderTraversalIterative (TreePoint: in BSTPoint) is
      Stack : array (1..Knt) of BSTPoint;
      Counter : Integer := 0;
      Top : BSTPoint := TreePoint;
   begin
      loop
         if Top /= null then
            Counter := Counter + 1;
            Put_Line(String(Top.Info.Name) & String(Top.Info.PhoneNumber));
            Stack(Counter) := Top;
            Top := Top.Llink;
         else
            if Counter = 0 then
               exit;
            else
               Top := Stack(Counter);
               Counter := Counter - 1;
               Top := Top.Rlink;
            end if;
         end if;
      end loop;

   end PreOrderTraversalIterative;

   procedure InOrderTraversal (TreePoint : in BSTPoint) is
      Stack : array (1..Knt) of BSTPoint;
      Counter : Integer := 0;
      Top : BSTPoint := TreePoint;
   begin
      loop
         if Top /= null then
            Counter := Counter + 1; Stack(Counter) := Top;
            Top := Top.Llink;
         else
            if Counter = 0 then
               exit;
            else
               top := stack(Counter); Counter := Counter - 1;
               Put_Line(String(Top.Info.Name) & String(Top.Info.PhoneNumber));
               Top := Top.Rlink;
            end if;
         end if;
      end loop;
   end InOrderTraversal;

end BSTops;



