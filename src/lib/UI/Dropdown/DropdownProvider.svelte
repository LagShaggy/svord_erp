<script lang="ts">
	import DropdownPannel from './DropdownPannel.svelte'

	let expanded: boolean = false
	const handleExpand = () => {
		expanded = !expanded
	}
</script>

<span class="relative">
	<button on:click={() => handleExpand()}>
		<slot />
	</button>
	{#if expanded}
		<slot name="pannel" />
	{/if}
</span>
