let intrev10(n: int): int =
  let rec reverse_helper(n: int)(acc: int): int =
    if n = 0 then
      acc
    else
      let last_digit = n mod 10 in
      let new_acc = acc * 10 + last_digit in
      let remaining_digits = n / 10 in
      reverse_helper remaining_digits new_acc
  in
  reverse_helper n 0