<script lang="ts">
	export let url: String | undefined | null

	// api found here: https://stackoverflow.com/questions/5119041/how-can-i-get-a-web-sites-favicon
	const api = `https://icons.duckduckgo.com/ip3/${url}.ico`
</script>

{#if url}
	<img class="h-5 w-auto" src={api} alt="company favicon" />
{/if}
