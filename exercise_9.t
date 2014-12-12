#! perl

use strict;
use warnings;
use diagnostics;

# use II::Z2P::Support;
use Test::More;
use Test::Exception;

# for this exercise, pretend you're writing a social media client that's going
# to integrate Facebook status updates, Twitter posts, and blog articles.

# Further, your boss has *demanded* that you implement classes for each of the
# three post types as child classes of a base 'Update' parent class. Other
# than that, he doesn't care how you model the data inside your objects.

# He's also given you this series of tests to define the methods and
# attributes you need to support.

BEGIN { use_ok 'Update' }
BEGIN { use_ok 'Update::Facebook' }
BEGIN { use_ok 'Update::Twitter' }
BEGIN { use_ok 'Update::Weblog' }

diag "FACEBOOK";
my $fb_post = Update::Facebook->new(
  author    => 'fake author' ,
  timestamp => '22:29 Tue 28 May 2013' ,
  content   => 'Play MegaPokerSlots NOW!' ,
);
isa_ok( $fb_post , 'Update' );
isa_ok( $fb_post , 'Update::Facebook' );

can_ok( $fb_post , 'like'    );
can_ok( $fb_post , 'share'   );
can_ok( $fb_post , 'comment' );

my $share = $fb_post->share();
isa_ok( $share , 'Update::Facebook' );
is( $share->content , $fb_post->content , 'share has same content' );

dies_ok { $fb_post->comment() } 'comment requires body';
ok( $fb_post->comment( body => 'comment' ) , 'works okay with body' );

diag "TWITTER";
my $tweet = Update::Twitter->new(
  author    => 'twitter user' ,
  timestamp => 1369805570 ,
  content   => 'So excited to go to #yapc!' ,
);
isa_ok( $tweet , 'Update'          );
isa_ok( $tweet , 'Update::Twitter' );

can_ok( $tweet , 'retweet'  );
can_ok( $tweet , 'reply'    );

my $rt = $tweet->retweet();
isa_ok( $rt , 'Update::Twitter' );
is( $rt->content , "RT: " . $tweet->content , 'expected body' );

dies_ok { $tweet->reply() } 'reply needs a body';

my $reply = $tweet->reply( body => 'test reply' );
isa_ok( $reply , 'Update::Twitter' );
is( $reply->content , 'test reply' , 'expected body' );

diag "WEBLOG";
my $post = Update::Weblog->new(
  author    => 'weblog author' ,
  timestamp => '28 May 2013' ,
  content   => '2000 words about how awesome Perl is' ,
  blog_name => 'Perl is SOOOOOO AWESOME!!!!1111!!!!2' ,
  blog_url  => 'www.perlisawesomesauce.com' ,
);
isa_ok( $post , 'Update'         );
isa_ok( $post , 'Update::Weblog' );

can_ok( $post , 'comment' );
can_ok( $post , 'share'   );

dies_ok { $post->comment() } 'comment requires content';
ok( $post->comment( content => 'comment' ) , 'works okay with content' );

done_testing();
completed_exercise();
