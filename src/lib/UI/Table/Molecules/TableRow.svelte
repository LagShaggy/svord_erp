<script lang="ts">
	export let colour: string
	export let handleClick: (e: MouseEvent) => void
</script>

<tr class="xl:hover:bg-yellow-50 cursor-pointer {colour}" on:click={handleClick}>
	<slot />
</tr>
