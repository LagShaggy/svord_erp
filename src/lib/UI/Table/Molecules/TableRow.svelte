<script lang="ts">
	export let colour: string
	export let handleClick: (e: MouseEvent) => void
</script>

<tr class="xl:hover:bg-yellow-50 active:border-2 {colour}" on:click={handleClick}>
	<slot />
</tr>
