open Tsdl
open Tgl3
open Result

let () = match Sdl.init Sdl.Init.video with
  | Error (`Msg e) -> Sdl.log "Init error: %s" e; exit 1
  | Ok () ->
	match Sdl.create_window ~w:640 ~h:480 "SDL OpenGL" Sdl.Window.opengl with
	| Error (`Msg e) -> Sdl.log "error: %s" e; exit 1
	| Ok w -> 
	  Sdl.gl_set_attribute Sdl.Gl.context_profile_mask Sdl.Gl.context_profile_core;
	  Sdl.gl_set_attribute Sdl.Gl.context_major_version 3;
	  Sdl.gl_set_attribute Sdl.Gl.context_minor_version 3;
	  Sdl.delay 5000l;
	  Sdl.destroy_window w;
	  Sdl.quit ();
	  exit 0

