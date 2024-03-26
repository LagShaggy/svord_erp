<script lang="ts">
	import Button from '../Button.svelte'

	export let className: string = ''
</script>

<Button submit={true} {className}>
	<slot />
</Button>
