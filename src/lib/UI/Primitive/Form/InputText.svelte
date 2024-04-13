<script lang="ts">
	import Input from './Atoms/Input.svelte'

	export let name: string = 'text'
	export let value: string | undefined
	export let placeholder: string = 'Text'
</script>

<Input type="text" {name} {placeholder} value={value ?? ''} {...$$props}>
	<slot />
</Input>
