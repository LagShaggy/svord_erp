<script lang="ts">
	import Input from './Atoms/Input.svelte'

	export let name: string = 'text'
	export let value: string = ''
	export let placeholder: string = 'Email'
</script>

<Input type="email" {name} {placeholder} {value} {...$$props}>
	<slot />
</Input>
