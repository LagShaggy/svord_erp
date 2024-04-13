<script lang="ts">
	import Input from './Atoms/Input.svelte'

	export let name: string = ''
	export let placeholder: string = 'Password'
</script>

<Input type="password" {name} {placeholder} {...$$props}>
	<slot />
</Input>
