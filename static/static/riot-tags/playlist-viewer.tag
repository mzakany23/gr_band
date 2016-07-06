<playlist-viewer>
	<div class="albums-block">
                <div class="row">
                    <div each={ playlist in opts.playlists } class="item col-xs-12 col-md-4">
                        <div class="item-inner">
                             <h3 class="album-title">
                                { playlist.title }
                            </h3>
                            <div class="cover-holder">
                                
                                <a class="cover-figure" href="#">
                                    
                                    <div class="record-holder">
                                    	<img class="img-responsive" src='{ location.origin }/static/assets/images/record.png' alt="">
                                    </div>

                                    <img class="cover-image img-responsive" src="{ playlist.artwork_url }" alt="" height='300' width='300'>
                                    
                                    <!-- <div class="cover-label">Coming Soon</div> -->

                                </a><!--//cover-figure-->

                                <a class="btn btn-sm btn-ghost-secondary scrollto" onclick={ showPlaylist }>{ playlist.title }</a>
                               
                            </div><!--//cover-holder-->
                            
                            
                        </div><!--//item-inner-->
                    </div><!--//item-->
                   
                </div><!--//row-->
            </div><!--//albums-block-->

            <div class="container">
            	<h2 id='tracks'>{ currentPlaylist.title }: { currentPlaylist.tracks.length } tracks</h2>
            </div>

            <playlist-tracks></playlist-tracks>
<script>
	var self = this
	self.currentPlaylist = null
	this.on('mount',function(){
		if (opts.playlists && opts.playlists[0].tracks) {
			self.loadPlaylist(opts.playlists[0].tracks)
			self.currentPlaylist = opts.playlists[0]
		}
		self.update()
	})

	showPlaylist(e){
		self.currentPlaylist = e.item.playlist
		tracks = e.item.playlist.tracks
		self.loadPlaylist(tracks)
		self.update()
	}

	loadPlaylist(tracks){
		riot.mount('playlist-tracks',{
			tracks: tracks
		})
	}
</script>

</playlist-viewer>