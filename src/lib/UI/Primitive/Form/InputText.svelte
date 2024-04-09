<script lang="ts">
	import Input from './Atoms/Input.svelte'

	export let name: string = 'text'
	export let value: string = ''
	export let placeholder: string = 'Text'
</script>

<Input type="text" {name} {placeholder} {value} {...$$slots}>
	<slot />
</Input>
