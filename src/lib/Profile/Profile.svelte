<script lang="ts">
	import { onMount } from 'svelte'
	import type { Profile } from '../supabase/schema'
	import { getImage } from '../supabase/api/storage/getImageUrl'
	import { browserSupabase } from '../supabase/supabaseClient'
	import { Bucket } from '../supabase/api/storage/uploader'

	export let profile: Profile
	export let className: string = ''

	let pp: string
	onMount(async () => {
		pp = await getImage(browserSupabase, {
			bucket: Bucket.Images,
			fileName: profile.avatar_url
		})
	})
</script>

<div class="grid grid-cols-2 justify-center md:w-1/2 mx-auto gap-5 {className}">
	<img class="aspect-auto w-40 rounded-md" src={pp} alt="" />
	<div class="w-1/2">
		<h1>{profile?.firstname}</h1>
		<h1>{profile?.lastname}</h1>
	</div>
</div>
