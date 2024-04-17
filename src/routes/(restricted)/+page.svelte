<script lang="ts">
	import BasePage from '$lib/UI/BasePage.svelte'
	import { onMount } from 'svelte'
	import type { PageData } from './$types'
	import { browserSupabase } from '$src/lib/supabase/supabaseClient'

	export let data: PageData
	let { session, supabase } = data
	console.log(session)

	const url = 'http://127.0.0.1:54321/storage/v1/object/sign/images/banana.jpeg'

	const token =
		'?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1cmwiOiJpbWFnZXMvYmFuYW5hLmpwZWciLCJpYXQiOjE3MTMzNDE1NjYsImV4cCI6MTcxMzk0NjM2Nn0.13CIpcM9W5NSKuMiw1Ix-4vrvv2bO__nI3GCUwpGJys&t=2024-04-17T08%3A12%3A46.341Z'

	let stuff: string | undefined
	onMount(async () => {
		const { data: imgurl } = await browserSupabase.storage
			.from('images')
			.createSignedUrl('banana.jpeg', 60)
		stuff = imgurl?.signedUrl
		console.log(stuff)
	})
</script>

<BasePage
	title="MAIN PAGE"
	description="this it the main page, here you can find information about everything"
>
	<img src={url + token} alt="" />
	<img src={stuff} alt="" />
</BasePage>
