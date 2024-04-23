@default_files = ('HsH-classes.dtx');

# generall settings:
$pdf_mode = 1; # use pdflatex

push @final_output_exts, 'ins', 'cls', 'cfg';
push @generated_exts, 'hd';


$makeindex = 'makeindex -s gind.ist %S';
add_cus_dep( 'glo', 'gls', 0, 'makeglo2gls' );
push @generated_exts, 'glo', 'gls';
sub makeglo2gls {
	my ($base_name, $path) = fileparse( $_[0] );
	pushd( $path );
	system "makeindex", "-s", "gglo.ist", "-o", "$base_name.gls", "$base_name.glo" ;
	popd();
}
