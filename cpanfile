requires "CPAN::Meta" => "0";
requires "Carp" => "0";
requires "Data::Dumper::Concise" => "0";
requires "Devel::Dwarn" => "0";
requires "Encode" => "0";
requires "IO::Prompt::Tiny" => "0";
requires "IPC::System::Simple" => "0";
requires "List::AllUtils" => "0";
requires "Moo" => "0";
requires "MooX::Options" => "0";
requires "Path::Tiny" => "0";
requires "Pithub" => "0";
requires "RT::Client::REST" => "0";
requires "RT::Client::REST::Ticket" => "0";
requires "RT::Client::REST::User" => "0";
requires "Search::Elasticsearch" => "0";
requires "Specio::Declare" => "0";
requires "Specio::Library::Builtins" => "0";
requires "Specio::Library::Numeric" => "0";
requires "Specio::Library::Perl" => "0";
requires "Specio::Library::String" => "0";
requires "Try::Tiny" => "0";
requires "namespace::autoclean" => "0";
requires "perl" => "v5.10.0";
requires "strict" => "0";
requires "warnings" => "0";

on 'test' => sub {
  requires "ExtUtils::MakeMaker" => "0";
  requires "File::Spec" => "0";
  requires "Test::More" => "0.96";
};

on 'test' => sub {
  recommends "CPAN::Meta" => "2.120900";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
};

on 'develop' => sub {
  requires "Code::TidyAll::Plugin::Test::Vars" => "0.02";
  requires "File::Spec" => "0";
  requires "IO::Handle" => "0";
  requires "IPC::Open3" => "0";
  requires "Parallel::ForkManager" => "1.19";
  requires "Perl::Critic" => "1.126";
  requires "Perl::Tidy" => "20160302";
  requires "Pod::Coverage::TrustPod" => "0";
  requires "Pod::Wordlist" => "0";
  requires "Test::CPAN::Changes" => "0.19";
  requires "Test::CPAN::Meta::JSON" => "0.16";
  requires "Test::CleanNamespaces" => "0.15";
  requires "Test::Code::TidyAll" => "0.50";
  requires "Test::EOL" => "0";
  requires "Test::Mojibake" => "0";
  requires "Test::More" => "0.96";
  requires "Test::NoTabs" => "0";
  requires "Test::Pod" => "1.41";
  requires "Test::Pod::Coverage" => "1.08";
  requires "Test::Portability::Files" => "0";
  requires "Test::Spelling" => "0.12";
  requires "Test::Vars" => "0.009";
  requires "Test::Version" => "2.05";
  requires "blib" => "1.01";
};