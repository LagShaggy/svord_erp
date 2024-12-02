<script lang="ts">
	import type { Snippet } from "svelte"

	let { name = 'default', children , file = $bindable() }:
		{ name: string , children: Snippet, file: FileList} = $props()

</script>

<label class="flex justify-center gap-3 cursor-pointer text-center" for="file_upload">
	{#if children}
	{@render children()}

	{:else}
		<p>
		Upload Image
		</p>
	{/if}
</label>
<input bind:files={file} type="file" {name} class="hidden" id="file_upload" />

