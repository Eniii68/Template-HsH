# use pdflatex
$pdf_mode = 1;

# use bibtex
$bibtex_use = 2;
$clean_ext .= " run.xml";

# use and auxilary folder for temp files
$aux_dir = './.aux/';

# put the ./src subfolder on searchpath
ensure_path( 'TEXINPUTS', './src//' );

# enable synctex
set_tex_cmds( '-synctex=1 -interaction=nonstopmode %O %S' );

# create glossaries:
add_cus_dep( 'acn', 'acr', 0, 'makeglossaries' );
add_cus_dep( 'glo', 'gls', 0, 'makeglossaries' );
$clean_ext .= " acr acn alg glo gls glg ist";
sub makeglossaries {
	my ($base_name, $path) = fileparse( $_[0] );
	my @args = ( "-q", "-d", $path, $base_name );
	if ($silent) { unshift @args, "-q"; }
	return system "makeglossaries", "-d", $path, $base_name;
}

# Listings files
$clean_ext .= " lol";  # clean tempfile for List of Listings

# simple svg dependencies via InkScape
add_cus_dep( 'svg', 'pdf', 0, 'runInkscape' );
sub runInkscape {
	my ($base_name, $path) = fileparse( $_[0] );
	$svg = "$path$base_name.svg";
	$pdf = "$path$base_name.pdf";
	return system "inkscape", "-C", $svg, "-o", $pdf;
}
