package RelatedEntries::Callbacks;

use strict;

sub post_save {
    my ( $cb, $obj, $orig ) = @_;
    my @tags = $obj->get_tags();
    my $terms = { name => \@tags };
    my $tags = [ MT->model('tag')->load($terms, {
        ( $terms ? ( binary => { name => 1 } ) : () ),
        join => MT->model('objecttag')->join_on('tag_id', {
            object_datasource => $obj->datasource,
            blog_id => $obj->blog_id,
        }, { unique => 1 } ),
    }) ];
    my @tag_ids = map { $_->id, ( $_->n8d_id ? ( $_->n8d_id ) : () ) } @$tags;
    my $terms = { 
        tag_id => \@tag_ids,
        object_datasource => $obj->datasource,
    };
    my $args = {
        no_triggers => 1
    };
    my @ot_ids = MT->model('objecttag')->load($terms, $args) if @tag_ids;
    my @obj_ids = map { $_->object_id } @ot_ids;
    my $iter = MT->model('entry')->load_iter({ id => \@obj_ids });
    while (my $e = $iter->()) {
        next if $e->id == $obj->id; # do not publish yourself!
        MT->rebuild_entry( Entry => $e, BuildDependencies => 0 );
    }
}

1;
__END__
