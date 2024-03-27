<script lang="ts">
	import ClickableStyling from './Styling/ClickableStyling.svelte'

	export let path: string
</script>

<a href={path} class="flex justify-center items-center">
	<ClickableStyling>
		<slot />
	</ClickableStyling>
</a>
