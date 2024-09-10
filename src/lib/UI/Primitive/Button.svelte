<script lang="ts">
	export let command = () => {}
	export let submit = false
	export let formaction: string | null = null
	export let className: string = ''
</script>

<button
	on:click={command}
	type={submit ? 'submit' : null}
	class="transition-all flex justify-center items-center
	focus:border-secondary-700 focus:border
	{className}"
	{formaction}
	{...$$props}
>
	<slot />
</button>
