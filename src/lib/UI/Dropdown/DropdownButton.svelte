<script lang="ts">
	export let handleExpand: () => void
</script>

<button on:click={handleExpand}>
	<slot />
</button>
