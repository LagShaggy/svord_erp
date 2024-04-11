<script lang="ts">
	import Input from './Atoms/Input.svelte'

	export let name: string = 'file'
</script>

<Input type="file" {name} {...$$props} className="border-none bg-inherit rounded-none">
	<slot />
</Input>
