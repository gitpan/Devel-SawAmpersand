use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'Devel::SawAmpersand',
    'VERSION_FROM' => 'lib/Devel/SawAmpersand.pm', # finds $VERSION
    'LIBS'	=> [''],   # e.g., '-lm' 
    'DEFINE'	=> '',     # e.g., '-DHAVE_SOMETHING' 
    'INC'	=> '',     # e.g., '-I/usr/include/other' 
    'dist'      => {
		    COMPRESS => 'gzip -9',
		    PREOP => 'co -l README && pod2text lib/Devel/SawAmpersand.pm > README && ci -u README',
		   },
);
