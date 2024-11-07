use strict;
use warnings;
use utf8;

use Term::ANSIColor;
use Term::ReadKey;
use HTML::TreeBuilder;

if ($^O eq "MSWin32") {
    binmode "STDIN", ":encoding(CP-850)";
    binmode "STDOUT", ":encoding(CP-850)";
} else {
    binmode "STDIN", ":encoding(UTF-8)";
    binmode "STDOUT", ":encoding(UTF-8)";    
}


# Fonction récursive de vérification de l'entrée utilisateur
sub input_check {
    my ($prompt, $pattern, $fail_msg) = @_;
    print $prompt;
    my $user_input = <STDIN>;
    chomp $user_input;
    if ($user_input =~ $pattern) {
        return $user_input;
    }
    print colored($fail_msg."\n", "red");
    return input_check($prompt, $pattern, $fail_msg);
}

# Affichage de l'interface textuelle
print "Découvrez votre compatibilité amoureuse du jour !\n\n";
my @astro_signs = qw(Bélier Taureau Gémeaux Cancer Lion Vierge Balance Scorpion Sagittaire Capricorne Verseau Poissons);
foreach my $index (0..$#astro_signs) {
    print(($index + 1) . " : " . $astro_signs[$index] . "\n");
}

# Récupération du signe astrologique de l'utilisateur
my $astro_signs_pattern = join "|", 1..@astro_signs;
my $user_sign_number = input_check("\n> Entrez le numéro de votre signe astrologique : ",
                                   qr/^($astro_signs_pattern)$/,
                                   "Numéro de signe invalide !");
# Normalisation du signe en vue de sa concaténation à l'URL
my $user_sign = lc $astro_signs[$user_sign_number - 1];
$user_sign =~ s/é/e/g;

# Récupération du statut amoureux de l'utilisateur
my $is_single = input_check("\n> Êtes-vous célibataire ? (o/n) ", qr/^[on]$/i, "Entrez une option valide !");

# Récupération des <div> contenant les textes de compatibilité du jour
my $tree = HTML::TreeBuilder->new_from_url("https://www.horoscope.fr/horoscopes/aujourdhui/" . $user_sign);
my @relationship_boxes = $tree->look_down("class", "DailyHoroscopeContent_doubleCol__WFTzz")
                              ->look_down("class", "HoroscopeSection_horoscopeSection__kenBG");

# Affichage du "lovoscope" journalier de l'utilisateur
print "\nCompatibilité du jour :\n";
if ($is_single =~ /o/i) {
    print colored($relationship_boxes[0]->look_down("_tag", "p")->as_text() . "\n", "bright_magenta");
} else {
    print colored($relationship_boxes[1]->look_down("_tag", "p")->as_text() . "\n", "bright_magenta");
}

# Attente de la touche "Enter" pour laisser le temps de lire le lovoscope et quitter gracieusement le programme
END {
    no warnings;
    local $| = 1;

    print "\nAppuyez sur Entrée pour quitter...";

    ReadMode("cbreak");
    while (1) {
        my $key = ReadKey(0);
        last if defined($key) && ($key eq "\n" || $key eq "\r");
    }
    ReadMode("normal");
    print "\n";
}