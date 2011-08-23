my %changesNotNamed=(
	"pozadavky"=>"{Po�adavky}{0}{0}",	
	"poziadavky"=>"{Po�adavky}{0}{0}",
	"definiceSkull"=>"{Definice}{1}{0}",	
	"definice"=>"{Definice}{0}{0}",
	"definicia"=>"{Definice}{0}{0}",
	"vetaSkull"=>"{Veta}{1}{0}",
	"pozorovani"=>"{Pozorov�n�}{0}{0}",
	"pozorovanie"=>"{Pozorov�n�}{0}{0}",
	"poznamka"=>"{Pozn�mka}{0}{0}",
	"lemma"=>"{Lemma}{0}{0}",
	"vetaSK"=>"{V�ta}{0}{0}",
	"dusledek"=>"{D�sledek}{0}{0}",
	"dusledok"=>"{D�sledek}{0}{0}",
	"dokaz"=>"{D�kaz}{0}{0}",
	"dukaz"=>"{D�kaz}{0}{0}",
	"ideadukazu"=>"{Idea d�kazu}{0}{0}",
	"priklad"=>"{P��klad}{0}{0}",
	"prikladSK"=>"{P��klad}{0}{0}",
	"priklady"=>"{P��klady}{0}{0}",
	"prikladySK"=>"{P��klady}{0}{0}",
	"veta"=>"{V�ta}{0}{0}"
);

my %changesNamed=(
	"definiceNSkull" => "{Definice}{1}",
	"definiceN"=>"{Definice}{0}",
	"definiaN"=>"{Definice}{0}",
	"vetaNSkull"=>"{V�ta}{1}",
	"poznamkaN"=>"{Pozn�mka}{0}",
	"vetaN"=>"{V�ta}{0}",
	"vetaSKN"=>"{V�ta}{0}",
	"algoritmusN"=>"{Algoritmus}{0}",
);

use warnings;
use strict;

my $line = $_;

chomp($line);
$line=~s/\r//;

for my $key (keys %changesNotNamed) {
	if ($line=~/\\begin\s*{$key}/) {
		$line=~s/\\begin\s*{[^}]*}/\\begin{e}/;
		$line = $line.$changesNotNamed{$key};
	}
}

for my $key (keys %changesNotNamed, keys %changesNamed) {
	if ($line=~/\\end\s*{$key}/) {
		$line=~s/\\end\s*{[^}]*}/\\end{e}/;
		#$line = $line.$changesNotNamed{$key};
	}
}

for my $key (keys %changesNamed) {
	if ($line=~/\\begin\s*{$key}\s*({.*})/) {
		my $N=$1;
		$line=~s/\\begin\s*{[^}]*}\s*{.*}/\\begin{e}/;
		$line = $line.$changesNamed{$key};
		$line = $line.$N;

	}
}


print $line."\n";

