<script lang="ts">
	import ClickableStyling from './Styling/ClickableStyling.svelte'

	export let command = () => {}
	export let submit = false
	export let formaction: string | null = null
	export let className: string = ''
</script>

<button
	on:click={command}
	type={submit ? 'submit' : null}
	class="border border-comp-colour button rounded-full text-center {className}"
	{formaction}
>
	<slot />
</button>
