<script lang="ts">
	export let name: string
	export let value: string = ''
	export let className: string = ''
</script>

<textarea {name} {value} {...$$props} class="p-2 bg-inherit resize-y h-20 outline-none {className}"
></textarea>
