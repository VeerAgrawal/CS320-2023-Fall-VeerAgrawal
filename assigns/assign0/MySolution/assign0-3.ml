let rec int2str i =
  if i < 0 then "-" ^ int2str (-i)
  else if i < 10 then String.make 1 (Char.chr (48 + i))
  else int2str (i / 10) ^ int2str (i mod 10);;

(* let int2str(i0: int): string =
  string_of_int i0;; *)