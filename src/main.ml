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
	  Sdl.gl_set_attribute Sdl.Gl.doublebuffer 1;
	  match Sdl.gl_create_context w with
	  | Error (`Msg e) -> Sdl.log "error: %s" e; exit 1
	  | Ok ctx ->
		Sdl.gl_make_current w ctx;
		Tgl3.Gl.clear_color 0.0 0.5 1.0 1.0;
		Tgl3.Gl.clear Tgl3.Gl.color_buffer_bit;
		Sdl.gl_swap_window w;
		Sdl.delay 5000l;
		Sdl.gl_delete_context ctx;
		Sdl.destroy_window w;
		Sdl.quit ();
		exit 0

