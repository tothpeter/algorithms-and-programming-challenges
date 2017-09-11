package practice.LRUCache;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Arrays;

import org.junit.runner.RunWith;

import com.greghaskins.spectrum.Spectrum;
import static com.greghaskins.spectrum.dsl.specification.Specification.*;

@RunWith(Spectrum.class)
public class LRUCacheTest {{
	describe(".put", () -> {
		describe("When we add less items than the limit", () -> {
			it("contains all items", () -> {
				ArrayList<Integer> expectedOrder = new ArrayList<Integer>(Arrays.asList(1, 2, 3));
				
				LRUCache<Integer> cache = new LRUCache<Integer>(5);

				cache.put(3, "Key for 3");
				cache.put(2, "Key for 2");
				cache.put(1, "Key for 1");
				
				ArrayList<Integer> result = cache.getItems();
				
				assertEquals(expectedOrder, result);
			});
		});
		
		describe("When we add more items than the limit", () -> {
			it("contains only the last added items", () -> {
				ArrayList<Integer> expectedOrder = new ArrayList<Integer>(Arrays.asList(1, 2));
				
				LRUCache<Integer> cache = new LRUCache<Integer>(2);

				cache.put(3, "Key for 3");
				cache.put(2, "Key for 2");
				cache.put(1, "Key for 1");
				
				ArrayList<Integer> result = cache.getItems();
				
				assertEquals(expectedOrder, result);
				assertEquals(null, cache.get("Key for 3"));
			});
		});
	});
		
	describe(".get", () -> {
		it("returns the requested item", () -> {
			LRUCache<Integer> cache = new LRUCache<Integer>(3);

			cache.put(3, "Key for 3");
			cache.put(2, "Key for 2");
			
			int requestedItem = cache.get("Key for 3");

			assertEquals(3, requestedItem);
		});
		
		describe("When we get an item from the middle", () -> {
			it("makes the requested item the most recently used", () -> {
				ArrayList<Integer> expectedOrder = new ArrayList<Integer>(Arrays.asList(2, 1, 3));
				
				LRUCache<Integer> cache = new LRUCache<Integer>(3);
	
				cache.put(3, "Key for 3");
				cache.put(2, "Key for 2");
				cache.put(1, "Key for 1");
				
				cache.get("Key for 2");
				
				ArrayList<Integer> result = cache.getItems();
				
				assertEquals(expectedOrder, result);
			});
		});
		
		describe("When we get an item from the end", () -> {
			it("makes the requested item the most recently used", () -> {
				ArrayList<Integer> expectedOrder = new ArrayList<Integer>(Arrays.asList(3, 1, 2));
				
				LRUCache<Integer> cache = new LRUCache<Integer>(3);
	
				cache.put(3, "Key for 3");
				cache.put(2, "Key for 2");
				cache.put(1, "Key for 1");
				
				cache.get("Key for 3");
				
				ArrayList<Integer> result = cache.getItems();
				
				assertEquals(expectedOrder, result);
			});
		});

		describe("When we get an item from the begining", () -> {
			it("makes the requested item the most recently used", () -> {
				ArrayList<Integer> expectedOrder = new ArrayList<Integer>(Arrays.asList(1, 2, 3));
				
				LRUCache<Integer> cache = new LRUCache<Integer>(3);
	
				cache.put(3, "Key for 3");
				cache.put(2, "Key for 2");
				cache.put(1, "Key for 1");
				
				cache.get("Key for 1");
				
				ArrayList<Integer> result = cache.getItems();
				
				assertEquals(expectedOrder, result);
			});
		});
	});
}}
