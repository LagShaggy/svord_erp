<script lang="ts">
	import ClickableStyling from './Styling/ClickableStyling.svelte'

	export let command = () => {}
</script>

<button class="button flex justify-center items-center" on:click={command}>
	<ClickableStyling>
		<slot />
	</ClickableStyling>
</button>
