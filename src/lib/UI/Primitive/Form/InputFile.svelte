<script lang="ts">
	import Input from './Atoms/Input.svelte'

	export let name: string = 'text'
</script>

<Input type="file" {name}>
	<slot />
</Input>
