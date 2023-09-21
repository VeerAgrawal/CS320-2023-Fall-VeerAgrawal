let rec stringrev(cs: string): string =
  let len = String.length cs in
  if len <= 1 then cs
  else String.sub cs (len - 1) 1 ^ stringrev (String.sub cs 0 (len - 1))