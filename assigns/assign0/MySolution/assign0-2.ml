let isPrime(n) =
  let rec test(i: int): bool =
    if i <= 1 then true
    else if n mod i = 0 then false
    else test(i - 1)
  in
  if n < 2 then false else test(n - 1);;