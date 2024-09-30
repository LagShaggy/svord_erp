<script lang="ts">
	export let className = ''
</script>

<td class="px-2 md:px-4 py-2 border-b border-gray-200 text-sm {className}">
	<slot>
		<p>-</p>
	</slot>
</td>
