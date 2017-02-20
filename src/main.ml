open Tsdl
open Result

let () = match Sdl.init Sdl.Init.video with
  | Error (`Msg e) -> Sdl.log "Init error: %s" e; exit 1
  | Ok () ->
	match Sdl.create_window ~w:640 ~h:480 "SDL OpenGL" Sdl.Window.opengl with
	| Error (`Msg e) -> Sdl.log "error: %s" e; exit 1
	| Ok w -> 
	  Sdl.delay 5000l;
	  Sdl.destroy_window w;
	  Sdl.quit ();
	  exit 0

