<script lang="ts">
	import LoadingS from '$src/lib/Icons/LoadingS.svelte'
	import { getImage, type TransformOptions } from '$src/lib/supabase/api/storage/getImageUrl'
	import { Bucket } from '$src/lib/supabase/api/storage/uploader'
	import { browserSupabase } from '$src/lib/supabase/supabaseClient'

	export let coverImagePath
	export let className = ''
	export let imageSize: TransformOptions = {} as TransformOptions
</script>

<div class={className}>
	{#if coverImagePath}
		{#await getImage( browserSupabase, { bucket: Bucket.ProductImages, fileName: coverImagePath, imageSize } )}
			<LoadingS></LoadingS>
		{:then url}
			<img src={url} alt="" />
		{/await}
	{:else}
		<slot>No Image found</slot>
	{/if}
</div>
