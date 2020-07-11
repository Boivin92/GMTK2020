extends AudioStreamPlayer

export (Array, AudioStream) var streams = []

func play_random():
	if streams.size() != 0:
		self.stream = streams[ rand_range(0, streams.size()) ]
		self.play()
