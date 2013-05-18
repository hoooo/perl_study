#!/usr/bin/perl
use strict;
use warnings;

use base qw/Class::Accessor::Fast/;
__PACKAGE__->mk_accessors(qw/a b c/);


package Main;

sub main {

	my $creator = A->new();

	my $data = +{a => 1, b => 1,};

	my $is_success = $creator->add_data($data);

	if($is_success) {
		print "success\n";
	}else{
		print "fail\n";
	}
}


package A;

sub new {
	my($class) = @_;
	bless +{}, $class;
}

sub add_data {
	my($self, $args) = @_;

	# オブジェクトにundefが入っていないかチェック
	for my $key (keys %$self) {
		unless (exists $args->{$key}) {
			print "undef\n" unless(defined $args->{c});
			return 0;
		}
		#セッター
		$self->{$key} = $args->{$key};
	}

}




Main::main();
