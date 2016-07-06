<soundcloud>
	<h1>{ bandName }</h1>
	<img src="{ avatar }" class="img-circle">
	<h1>{ track.title }</h1>
	<soundplayer></soundplayer>
	<track-list></track-list>
<script>
	var self = this
	self.loading = false
	self.player = null
	self.tracks = null
	self.track = null
	self.userInfoUrl = 'https://soundcloud.com/user-401164110'
	self.playlistsUrl = 'https://soundcloud.com/user-401164110/sets/'

	this.on('mount',function(){
		self.init()
		
		self.getPlaylists().then((playlists) => {
			self.playlists = playlists
			firstPl = playlists[0]
			firstTr = playlists[0].tracks[0]
			if (typeof firstPl !== undefined && typeof firstTr !== undefined) {
				self.embedPlayer(firstTr)
				self.embedAllTracks(firstPl.tracks)
			}

			self.tracks = firstPl.tracks 
			self.track = firstPl.tracks[0]

		})

		self.getInfo(self.playlistsUrl).then((e) => {
			pl = e[0]
			self.bandName = pl.user.username
			self.avatar = pl.user.avatar_url
		}).catch((e) => {
			console.log(e)
		})
	})

	init(){
		SC.initialize({
		  client_id: opts.clientid
		});
	}

	embedAllTracks(tracks){
		riot.mount('track-list',{tracks: tracks,bus:opts.bus})
	}

	embedPlayer(track){
		SC.oEmbed(track.permalink_url, { auto_play: false })
		.then(function(oEmbed) {
			riot.mount('soundplayer',{html: oEmbed.html})
			self.update()  
		})
	}

	getInfo(resolveUrl){
		base = 'http://api.soundcloud.com/resolve'
		url = `${base}?url=${resolveUrl}&client_id=${opts.clientid}`
		
		return new Promise((resolve,reject) => {
			$.get(url).then((e) => {
				resolve(e)
			})	
		})
		
	}

	getTracks(){
		url = `/users/${opts.id}/tracks`

		return SC.get(url).then((tracks) => {
			return new Promise((resolve,reject) => {
				resolve(tracks)
			})
		})
	}

	getPlaylists(){
		return new Promise((resolve,reject) => {
			self.getInfo(self.playlistsUrl).then((playlists) => {
				resolve(playlists)
			})
		})
	}

	opts.bus.on('updateTrack',function(track){
		self.track = track
		self.embedPlayer(track)
		scroll(0,0)
	})
</script>

</soundcloud>