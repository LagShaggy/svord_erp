<script lang="ts">
	export let colour: string
	export let className = ''
	export let handleClick: (e: MouseEvent) => void
</script>

<tr class="xl:hover:bg-yellow-50 cursor-pointer {colour} {className}" on:click={handleClick}>
	<slot />
</tr>
