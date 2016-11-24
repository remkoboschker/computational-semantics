

read_stuff(File):-
   open(File,read,Stream),
   read_all_lines(Stream),
   close(Stream).

read_all_lines(Stream):-
   read_line_to_codes(Stream,Codes),
   process_line(Codes,Stream).

process_line(end_of_file,_):- !.
process_line(Codes,Stream):-
   atom_codes(Atom,Codes),
   write(Atom), nl,
   read_all_lines(Stream).






