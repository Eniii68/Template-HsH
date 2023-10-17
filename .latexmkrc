# list of files in this project
# @default_files = ('file.tex', 'file.tex');

# generall settings:
$aux_dir = '.aux/'; # use and auxilary folder for temp files
$pdf_mode = 1; # use pdflatex
$bibtex_use = 2; # use biber

push @generated_exts, "run.xml"; # biber creates this file
push @generated_exts, "lol"; # the listings package creates this file

# put the ./src subfolder on searchpath
ensure_path( 'TEXINPUTS', './src//' );

# enable synctex
set_tex_cmds( '-synctex=1 -interaction=nonstopmode %O %S' );

# create glossaries:
add_cus_dep( 'acn', 'acr', 0, 'makeglossaries' );
add_cus_dep( 'glo', 'gls', 0, 'makeglossaries' );
push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
$clean_ext .= ' %R.ist %R.xdy';
sub makeglossaries {
	my ($base_name, $path) = fileparse( $_[0] );
	my @args = ( "-q", "-d", $path, $base_name );
	if ($silent) { unshift @args, "-q"; }
	return system "makeglossaries", "-d", $path, $base_name;
}

# simple svg dependencies via InkScape
add_cus_dep( 'svg', 'pdf', 0, 'runInkscape' );
sub runInkscape {
	my @args = ( "--export-type=pdf", "--export-area-page" );
	return system "inkscape", @args, "$_[0].svg";
}
