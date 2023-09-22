let string_merge(cs1: string)(cs2: string): string =
  let merge_chars(char1: char)(char2: char): char list =
    if char1 <= char2 then [char1; char2]
    else [char2; char1]
  in
  let merge_helper(acc: char list)(char1: char)(char2: char): char list =
    match (char1, char2) with
    | (_, _) when char1 = char2 -> char1 :: acc
    | (_, _) -> List.rev_append (merge_chars char1 char2) acc
  in
  let merged_chars = string_make_fwork (fun work ->
    let rec merge_strings cs1 cs2 =
      match (cs1, cs2) with
      | "", "" -> ()
      | "", cs2' -> string_foreach cs2' work
      | cs1', "" -> string_foreach cs1' work
      | cs1', cs2' ->
        let char1 = string_head cs1' in
        let char2 = string_head cs2' in
        let new_cs1 = string_tail cs1' in
        let new_cs2 = string_tail cs2' in
        let merged = merge_helper [] char1 char2 in
        let merged_string = string_of_list merged in
        work merged_string;
        merge_strings new_cs1 new_cs2
    in
    merge_strings cs1 cs2
  ) in
  string_of_list merged_chars