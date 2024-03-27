<script lang="ts">
	import Button from '../Button.svelte'

	export let className: string = ''
	export let formaction: string | null = null
</script>

<Button submit={true} {className} {formaction}>
	<slot />
</Button>
